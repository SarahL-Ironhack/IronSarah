# -*- coding: utf-8 -*-
"""
Created on Fri Jan 14 10:17:33 2022

@author: Sarah
"""

import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

from sklearn import datasets

breast_cancer = datasets.load_breast_cancer(as_frame=True)

breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)

breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]

pd.set_option("display.max_columns", 50)
st.title("Breast Cancer Stats")


"""Create two dropdowns each having a list of measurements as options. Link one dropdown 
with the X-axis and one with the Y-axis of the scatter chart. 
Whenever dropdown values change, the scatter chart will be updated to show a relationship 
between selected measurements."""

measurements = breast_cancer_df.drop(labels=["target"], axis=1).columns.tolist()


X_axis = st.sidebar.selectbox("X-axis", measurements)
Y_axis = st.sidebar.selectbox('Y-axis', measurements)

if X_axis and Y_axis:
    fig = plt.figure(figsize=(6,4))
    scatter1 =fig.add_subplot(111)

    malignant_df = breast_cancer_df[breast_cancer_df["target"] == "malignant"]
    benign_df = breast_cancer_df[breast_cancer_df["target"] == "benign"]
    
    malignant_df.plot.scatter(x=X_axis, y=Y_axis, ax=scatter1,c='r', label="Malignant")
    benign_df.plot.scatter(x=X_axis, y=Y_axis, ax=scatter1,c='b', label='Benign')

else:
    fig = plt.figure(figsize=(6,4))
    scatter1 = fig.add_subplot(111)

    malignant_df = breast_cancer_df[breast_cancer_df["target"] == "malignant"]
    benign_df = breast_cancer_df[breast_cancer_df["target"] == "benign"]
    
    malignant_df.plot.scatter(x="mean texture", y="mean area",c='r', ax=scatter1, label="Malignant")
    benign_df.plot.scatter(x="mean texture", y="mean area", ax=scatter1, label='Benign')

"""Create one multi-select for bar chart with all measurements names in it. 
Create a bar chart of average measurements based on a list of selected options in this multi-select."""

# calculate average data
avg_breast_cancer_df = breast_cancer_df.groupby("target").mean()
#reusing labels extracted previously + assigning default selected labels
multi = st.sidebar.multiselect('measurements names', measurements,default=["mean radius","mean area"],key=1)


if multi: #if selection do bar chart
    fig1 = plt.figure(figsize=(6,4))
    bar1 = fig1.add_subplot(111)
    sub_avg_breast_cancer_df = avg_breast_cancer_df[multi] # creating new df only with selected data
    sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar1, title="Average Measurements per Tumor Type"); # plotting the data
else: #if no selection do bar chart with default
    fig1 = plt.figure(figsize=(6,4))
    bar1 = fig1.add_subplot(111)
    sub_avg_breast_cancer_df = avg_breast_cancer_df[["mean radius", "mean texture", "mean perimeter", "area error"]]
    sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar1, title="Average Measurements per Tumor Type");
    
"""For the histogram,create a multi-select with a list of measurements. """
#multi already exists
multi2 = st.sidebar.multiselect('measurements names', measurements,default=["mean radius","mean texture", "mean perimeter", "area error"],key=2)

""""Create radio buttons and link them with a histogram to select bins of a histogram. """
radio_bins = st.sidebar.radio("bins", [10,20,30,40,50])

if radio_bins:
    fig2 = plt.figure(figsize=(6,4))
    hist1 = fig2.add_subplot(111)
    sub_df = breast_cancer_df[multi2]
    sub_df.plot.hist(bins=radio_bins, ax=hist1)
else:
    fig2 = plt.figure(figsize=(6,4))
    hist1 = fig2.add_subplot(111)
    sub_df = breast_cancer_df["mean radius", "mean texture"]
    sub_df.plot.hist(bins=radio_bins, ax=hist1)
    
"""Dropdowns for Hexbin Chart - Create two dropdowns like scatter plots and use them in the hexbin chart."""


hex_x = st.sidebar.selectbox("Hex_X-axis", measurements)
hex_y = st.sidebar.selectbox('Hex_Y-axis', measurements)

if hex_x and hex_y:
    fig3 = plt.figure(figsize=(6,4))
    hex1 = fig3.add_subplot(111)
    hex_x_df = breast_cancer_df[hex_x]
    hex_y_df = breast_cancer_df[hex_y]
    plt.hexbin(hex_x_df, hex_y_df)
else:
    fig3 = plt.figure(figsize=(6,4))
    hex1 = fig3.add_subplot(111)
    hex_x_df = breast_cancer_df['mean_texture']
    hex_y_df = breast_cancer_df['mean_area']
    plt.hexbin(hex_x_df, hex_y_df)

"""Columns Container - Use two main containers which will be laid out vertically one by one.
Then create two columns container in each of these containers."""
"""Please make a NOTE that all widgets are included in sidebar of the dashboard."""

st.markdown('**Please find all necessary widgets in the sidebar**')

container1 = st.container()
col1, col2 = st.columns(2)
with container1:
    with col1:
        fig
    with col2:
        fig1
container2 = st.container()
col3, col4 = st.columns(2)
with container2:
    with col3:
        fig2
    with col4:
        fig3




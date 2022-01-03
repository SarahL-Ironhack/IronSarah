#!/usr/bin/env python
# coding: utf-8

# In[2]:


# First step we define the bording board as a dictionary : each key from 1 to 9 is linked to an empty value
gaming_board = {
    '1':' ','2':' ','3':' ',
    '4':' ','5':' ','6':' ',
    '7':' ','8':' ','9':' '}

board_keys = []

for key in gaming_board:
    board_keys.append(key)

# this function calls de value from the gaming_board's keys and prints the result as well as the board lines. It will show if they are empty, X or O.
def board_visual(gaming_board):
    print(gaming_board['1'] + '|' + gaming_board['2'] + '|' + gaming_board['3'])
    print('-+-+-')
    print(gaming_board['4'] + '|' + gaming_board['5'] + '|' + gaming_board['6'])
    print('-+-+-')
    print(gaming_board['7'] + '|' + gaming_board['8'] + '|' + gaming_board['9'])

board_visual(gaming_board)

def playersturn():
    turn = 'X'
    count = 0
    for x in range(1,10):
        print("It's your turn ", turn,". Please chose a number between 1 and 9: ")
        (board_visual(gaming_board))
    
        move = input('Please type a number between 1 and 9: ')
        if gaming_board[move]==' ':
            gaming_board[move]=(turn)
            count +=1
            if count>=5:
                if gaming_board['1'] == gaming_board['2'] == gaming_board['3'] != ' ': #top line
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['4'] == gaming_board['5'] == gaming_board['6']!= ' ': # middle line
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['7'] == gaming_board['8'] == gaming_board['9']!= ' ': #bottom line 
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['1'] == gaming_board['4'] == gaming_board['7']!= ' ': # first vertical line
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['2'] == gaming_board['5'] == gaming_board['8']!= ' ': # second vertical line
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['3'] == gaming_board['6'] == gaming_board['9']!= ' ': # third vertical line
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['1'] == gaming_board['5'] == gaming_board['9']!= ' ': #top diagonal
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break
                elif gaming_board['7'] == gaming_board['5'] == gaming_board['3']!= ' ': #bottom diagonal
                    board_visual(gaming_board)
                    print("Game Over")
                    print("Player "+turn+" won")
                    break

            elif count == 9:
                board_visual(gaming_board)
                print("Game Over")
                print("It's a tie!")
                break
        else:
            print('Please choose a free box')
            continue
            
        
        

        if turn == 'X':
            turn = "O"
        else: 
            turn = 'X'
    
    restart = input("Do want to play Again?(y/n)")
    if restart == "y" or restart == "Y":  
        for key in board_keys:
            gaming_board[key] = " "
           

    playersturn()

if __name__ == "__main__":
     playersturn()


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





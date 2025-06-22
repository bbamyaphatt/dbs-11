def pizza ():
    # create menu dict
    menu = {'hawaiian pizza': 299,
            'spicy chicken pizza': 299,
            'pepperoni pizza': 299,
            'Mmats lover pizza': 299,
            'double cheese pizza': 299,
            'french fries': 69,
            'fried chicken': 139,
            'salad': 199,
            'water': 20,
            'coke': 30,
            'refill drinks':49
    }

    # set initial cost
    cost = 0.0

    print('Hello! Welcome to Pizzu Pizzie!')
    print('What can I help you?')

    # first loop -- select what to do
    while True:
        print('\nPlease select the choice below:')
        print('[1] See menu')
        print('[2] Order food')
        print('[3] Make payment')
        
        try:
            customer_input = int(input('Please enter your choice: '))
        except ValueError:
            print("Invalid input. Please enter 1, 2 or 3.")
            continue

        if customer_input == 1: # see menu
            print('\nSure! Here is our menu:\n---')

            for item, price in menu.items():
                print(f"{item} - {price} Baht")

            print('---')
            print('Are you ready to order?')
            print('[1] Yes')
            print('[2] No')

            try:
                ready = int(input('Your answer:'))
            except:
                print("Invalid input. Please enter 1 or 2.")

            if ready == 1: # ready to order
                print("Sure! Please choose choice [2]")
            elif ready == 2: # not ready to order
                print("Okay, see you next time!")
                break
            else:
                print("Invalid input. Please try again.")

        elif customer_input == 2: # order food
            while True: # second loop -- ordering food
                print('\nWhat would you like to order?')
                food_order = input('Please enter your food: ').lower()

                if food_order in menu:
                    food_price = menu[food_order]
                    print(f"You have ordered {food_order} for {food_price:.2f} Baht.")
                    cost = cost + food_price

                    should_exit_ordering = False # set to not exit ordering food

                    while True: # third loop -- ask if user wants to order anything else
                        print('\nDo you want to order anything else?')
                        print('[1] Yes')
                        print('[2] No')

                        try:
                            action = int(input('Please enter your choice: '))
                        except ValueError:
                            print("Invalid input. Please enter 1 or 2.")
                            continue 

                        if action == 1: # want to order more
                            break # exit from the third loop
                        elif action == 2: # do not want to order more
                            print('\nThank you for your order! Please wait for your order.')
                            print(f"The total is {cost:.2f} Baht.")
                            print('Please choose choice [3] to make a payment.')
                            should_exit_ordering = True # set to exit the second loop
                            break # exit from the third loop
                        else:
                            print('Invalid input. Please enter 1 or 2. ')

                    if should_exit_ordering: # this line is true -> exit from the second loop
                        break

                else:
                    print(f"The {food_order} is not on our menu, please try again.")

        elif customer_input == 3: # make a payment
            print('\nWould you like to pay by: ') 
            print('[1] cash')
            print('[2] card')
            print('[3] qr code')

            try:
                payment_method = int(input('Please enter your answer: '))
            except:
                print('Invalid input. Please enter 1,2 or 3.')
                continue

            print(f"\nThe total is {cost} Baht.")
            print('Thank you so much. Have a great day!')
            break
            

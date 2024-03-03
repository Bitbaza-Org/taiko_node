#!/bin/bash

# Make all shell scripts executable
chmod +x *.sh

# Function to execute selected script
execute_script() {
    case $1 in
        1) ./change_password.sh && echo "Password changes successfully." ;;
        2) ./setup_env.sh && echo "Environment and Dependencies installed successfully" ;;
        3) ./setup_node.sh && echo "Script 3 executed successfully." ;;
        4) ./setup_node_dashboard.sh && echo "Script 4 executed successfully." ;;
        *) echo "Invalid option" ;;
    esac
}

# Main program
while true; do
    # Display and execute each script sequentially
    execute_script 1
    read -p "Press Enter to continue to the next script..." || break

    execute_script 2
    read -p "Press Enter to continue to the next script..." || break

    execute_script 3
    read -p "Press Enter to continue to the next script..." || break

    execute_script 4
    read -p "Press Enter to exit..." && break
done


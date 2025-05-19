## moon.sh - A Tiny, Aesthetic System Fetch Script

moon.sh is a simple and visually appealing bash script designed to display key system information directly in your terminal. It leverages standard Linux utilities to provide a quick overview of your environment.
Features

    Displays Window Manager name

    Shows Kernel version

    Indicates the current Shell

    Lists your external IP address

    Shows the connected WiFi network name

Dependencies

This script relies on the following external commands:

    xprop: Used to fetch information about the window manager.

    iwgetid: Part of the wireless-tools package, used to get the SSID of the connected wireless network.

    uname: Standard utility to get kernel information.

    basename: Standard utility to extract the base name of the shell path.

    curl: Used to fetch the external IP address from ipinfo.io.

    awk, grep, cut, sed: Standard text processing utilities used for parsing output.

    tput: Used to clear the terminal.

Note: The script uses specific Unicode characters for icons. Ensure your terminal and font support these characters (like the Typicons font mentioned in the script comments) for the intended aesthetic.
How it Works

The script utilizes a combination of command-line tools and text processing to gather system information:

    Window Manager: It uses xprop to find the root window and then query the _NET_WM_NAME property to identify the window manager.

    WiFi Name: It calls iwgetid and parses its output to extract the SSID.

    Kernel & Shell: Standard uname and $SHELL variable with basename are used.

    External IP: curl fetches data from ipinfo.io, which is then parsed to get the IP address.

The script then uses ANSI escape codes to add color and formatting, presenting the information along with decorative elements.
Installation

    Save the script as moon.sh.

    Make it executable: chmod +x moon.sh

    Ensure you have the necessary dependencies installed (xprop, wireless-tools, curl). On Debian/Ubuntu-based systems, you might install them using:

    sudo apt update
    sudo apt install x11-utils wireless-tools curl

    (Package names may vary slightly on other distributions).

    Run the script from your terminal: ./moon.sh

Customization and Extending Functionality

The script is designed to be simple and easy to modify. You can add more system information by:

    Identifying the command: Find the bash command that provides the information you want (e.g., df -h for disk usage, free -h for memory usage, uptime for system uptime).

    Parsing the output: Use awk, grep, cut, sed, or other text processing tools to extract the specific piece of data you need from the command's output.

    Assigning to a variable: Store the extracted data in a bash variable.

    Adding an icon: Find a suitable Unicode character or icon font glyph.

    Adding to the cat <<EOF block: Include the new icon and variable in the formatted output section, using the existing color variables ($d, $t, $fX) to maintain the script's aesthetic.

Example: To add uptime, you could add lines like:

`up=$(echo "⏱ ") # Choose an appropriate icon`

`uptime_info=$(uptime -p) # Get human-readable uptime`

# Then add this line inside the EOF block:
    $f6$up $t$uptime_info

Feel free to experiment with different commands and formatting to make it your own!

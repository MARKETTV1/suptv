#!/bin/sh

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Start message
echo -e "${YELLOW}>>> ############################${NC}"
echo -e "${YELLOW}>>> plugin uploaded by team4e2${NC}"
echo -e "${YELLOW}>>>############################${NC}"

echo -e "${BLUE}>>> Starting Suptv Plugin update process...${NC}"

# Remove the old version
echo -e "${YELLOW}>>> Removing the old version of suptv...${NC}"
opkg remove enigma2-plugin-extensions-suptv
if [ $? -eq 0 ]; then
    echo -e "${GREEN}>>> Old version removed successfully!${NC}"
else
    echo -e "${RED}>>> Error: Failed to remove the old version.${NC}"
    exit 1
fi

# Download the new version
echo -e "${YELLOW}>>> Downloading the new version of suptv...${NC}"
wget -O /tmp/enigma2-plugin-extensions-suptv_4.3_all.ipk http://team4e2.xyz/plugins/enigma2-plugin-extensions-suptv_4.3_all.ipk
if [ $? -eq 0 ]; then
    echo -e "${GREEN}>>> New version downloaded successfully!${NC}"
else
    echo -e "${RED}>>> Error: Failed to download the new version.${NC}"
    exit 1
fi

# Install the new version
echo -e "${YELLOW}>>> Installing the new version of suptv...${NC}"
opkg install /tmp/enigma2-plugin-extensions-suptv_4.3_all.ipk
if [ $? -eq 0 ]; then
    echo -e "${GREEN}>>> New version installed successfully!${NC}"
else
    echo -e "${RED}>>> Error: Failed to install the new version.${NC}"
    exit 1
fi

# Restart Enigma2
echo -e "${YELLOW}>>> Restarting Enigma2...${NC}"
sleep 3
killall -9 enigma2
if [ $? -eq 0 ]; then
    echo -e "${GREEN}>>> Enigma2 restarted successfully!${NC}"
else
    echo -e "${RED}>>> Error: Failed to restart Enigma2.${NC}"
    exit 1
fi

# Completion message
echo -e "${BLUE}>>> Suptv Plugin updated successfully! Enjoy the new features.${NC}"
exit 0


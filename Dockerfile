# Use the latest Ubuntu LTS as the base image
FROM ubuntu:20.04

# Set the DEBIAN_FRONTEND to noninteractive to suppress prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the image and install system packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    xvfb \
    zip \
    ca-certificates \
    libnss3-dev \
    libasound2 \
    libxss1 \
    libappindicator3-1 \
    libindicator7 \
    gconf-service \
    libgconf-2-4 \
    libpango1.0-0 \
    xdg-utils \
    fonts-liberation \
    wmctrl

# Install Robot Framework and SeleniumLibrary along with other required Python packages
RUN pip3 install selenium==4.15.2 \
                 robotframework==6.1.1 \
                 robotframework-seleniumlibrary==6.2.0 \
                 robotframework-retryfailed==0.2.0 \
                 robotframework-pabot==2.16.0 \
                 openpyxl==3.1.2 \
                 allure-robotframework==2.13.2 \
                 webdrivermanager \
                 pandas

# Set the Chrome repository and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get -y install google-chrome-stable

# Set environment variables for Chrome to run in headless mode
ENV ROBOT_SELENIUM_BROWSER=chrome
ENV ROBOT_SELENIUM_ARGUMENTS="--headless,--no-sandbox,--disable-dev-shm-usage,--disable-gpu,--window-size=1920x1080"

# Set the working directory
WORKDIR /robot

# Copy the current directory contents into the container at /robot
COPY . /robot

# Execute the Robot Framework test cases
CMD ["pabot","--outputdir","results", "/robot/Web/RR/TestCases/Login/login_test.robot"]


FROM maven:3.5.3-jdk-8

LABEL author "Wasiq Bhamla <wasbhamla2005@gmail.com>"

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
	DISPLAY=:99 \
	SUITE_FILE=testng.xml

WORKDIR /usr/src

# Xvfb setup
RUN apt-get update -qqy \
	&& apt-get -qqy install xvfb x11vnc -y

# Expose VNC Port.
EXPOSE 5900

# Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update -qqy \
	&& apt-get -qqy install google-chrome-stable \
	&& rm /etc/apt/sources.list.d/google-chrome.list \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

# Setup environment and run the test.
ADD run.sh /usr/share/run.sh
ENTRYPOINT [ "/usr/share/run.sh" ]
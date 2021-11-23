FROM cm2network/steamcmd

# Prepare the game directory
USER root
RUN mkdir /opt/satisfactory-server && chown steam:steam /opt/satisfactory-server
USER steam

# Replace this value with the next build number. This helps re-building only when needed, since Docker will cache layers.
RUN echo "Server version: 173452"

# Install the game
RUN ./steamcmd.sh +login anonymous +force_install_dir /opt/satisfactory-server +app_update 1690800 validate +quit
COPY Game.ini /opt/satisfactory-server/FactoryGame/Saved/Config/LinuxServer/Game.ini
COPY Engine.ini /opt/satisfactory-server/FactoryGame/Saved/Config/LinuxServer/Engine.ini
COPY Scalability.ini /opt/satisfactory-server/FactoryGame/Saved/Config/LinuxServer/Scalability.ini
WORKDIR /opt/satisfactory-server

# Expose ports and set command
EXPOSE 7777/udp 15000/udp 15777/udp
CMD ["/opt/satisfactory-server/FactoryServer.sh", "-unattended"]

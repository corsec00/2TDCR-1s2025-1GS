FROM kalilinux/kali-rolling

# Atualiza o sistema e instala Metasploit
RUN apt-get update && \
    apt-get install -y metasploit-framework && \
    apt-get clean

# Define shell padrão
CMD ["/bin/bash"]

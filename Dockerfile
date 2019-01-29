from centos:7

ENV HOME /root
# Add node repo
RUN curl -sL https://rpm.nodesource.com/setup_11.x | bash -
# install all needed package for next steps
RUN yum install -y git ncurses-devel nodejs gcc-c++ make openssh-server
# Install vim
RUN git clone https://github.com/vim/vim.git ${HOME}/vim
WORKDIR ${HOME}/vim
RUN make -j8
RUN make install
# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
RUN ${HOME}/.fzf/install --all
# Use custom vim conf
ADD resources/vimconf/vim ${HOME}/.vim
ADD resources/vimconf/_vimrc ${HOME}/.vimrc
#Make container accessible from ssh
WORKDIR /etc/ssh/
RUN ssh-keygen -A
ADD resources/ssh/sshd_config ./
ADD --chown=root:root resources/ssh/keys/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

CMD /sbin/sshd -d

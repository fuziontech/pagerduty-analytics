from fabric.api import *

env.hosts = ['172.17.21.206', '172.17.20.17']


@parallel
def deploy():
    with cd("/home/ubuntu/pda/"):
        run("git pull ")
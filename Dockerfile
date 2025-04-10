# ベースイメージとしてjupyter/datascience-notebookの最新版を使用
FROM jupyter/datascience-notebook:latest

# 以降のRUNコマンドを実行するためにユーザーをrootに変更
USER root

# jovyanユーザーに対してパスワードなしでsudoを許可する設定を/etc/sudoersに追加
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apt update && apt install -y \
htop \
vim
#firefox \
#firefox-locale-ja

RUN pip install -r requirements.txt


# ユーザーをjovyanに戻す
USER jovyan

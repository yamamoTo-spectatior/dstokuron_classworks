# ベースイメージとしてjupyter/datascience-notebookの最新版を使用
FROM jupyter/datascience-notebook:latest

# 以降のRUNコマンドを実行するためにユーザーをrootに変更
USER root

# jovyanユーザーに対してパスワードなしでsudoを許可する設定を/etc/sudoersに追加
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN apt update && apt install -y \
htop \
graphviz \
fonts-ipafont \
vim
#firefox \
#firefox-locale-ja

# requirements.txtをDockerコンテナ内の任意の場所にコピー
COPY requirements.txt /tmp/requirements.txt

# requirements.txtを使ってPythonパッケージをインストール
RUN pip install -r /tmp/requirements.txt


# ユーザーをjovyanに戻す
USER jovyan

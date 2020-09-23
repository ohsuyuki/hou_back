FROM ruby:2.6.5

# 必要なものをインストール
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs

# rails用のディレクトリを作成
RUN mkdir /hou_back

# ローカルマシン(Mac)からコンテナの中にファイルをコピー
COPY Gemfile /hou_back
COPY Gemfile.lock /hou_back

# 作業ディレクトリを指定
WORKDIR /hou_back

# 上でコピーしたGemfileに従ってGemをインストール
RUN gem install bundler && bundle install
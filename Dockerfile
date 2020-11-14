FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp_dockers
WORKDIR /myapp_dockers
COPY /Gemfile /myapp_dockers/Gemfile
COPY /Gemfile.lock /myapp_dockers/Gemfile.lock
RUN bundle install
COPY . /myapp_dockers

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# メインプロセスの起動
CMD ["rails", "server", "-b", "0.0.0.0"]

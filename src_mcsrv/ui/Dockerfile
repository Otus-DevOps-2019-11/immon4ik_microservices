FROM alpine:3.9.4

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN apk update --no-cache \
	&& apk add --no-cache build-base ruby-full ruby-dev ruby-bundler \
	&& gem install bundler --no-ri --no-rdoc \
	&& bundle install \
	&& apk del build-base ruby-dev

# RUN rm -rf $APP_HOME
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]

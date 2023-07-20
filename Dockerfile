FROM google/dart:latest
WORKDIR /app
ADD ./unpub/pubspec.* /app/
RUN pub get
ADD ./unpub/ /app
RUN pub get --offline
RUN dart2native bin/main.dart -o bin/main
EXPOSE 4000
ENTRYPOINT ["/app/bin/main -d $DATABASE_URL"]

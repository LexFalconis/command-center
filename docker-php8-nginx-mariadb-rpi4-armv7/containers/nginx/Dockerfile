FROM nginx:1.19.3

LABEL maintainer='Alex L. Barros <lex.falconis@gmail.com>'

# Fix Timezone America/Sao_Paulo
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

FROM amazoncorretto/alpine-preview:11-alpine-jre
LABEL maintainer="Nicolas KEMPF <contact@nicolaskempf.fr>"

ENV OTP_VERSION=2.0.0-rc1
ENV JAVA_OPTIONS=-Xmx1G

ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$OTP_VERSION/otp-$OTP_VERSION-shaded.jar /usr/local/share/java/

RUN ln -s otp-$OTP_VERSION-shaded.jar /usr/local/share/java/otp.jar

COPY otp /usr/local/bin/

EXPOSE 8080

ENTRYPOINT ["otp"]
CMD ["--help"]
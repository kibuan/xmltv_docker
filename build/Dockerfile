# Dockerfile to generate CentOS 8 build container for XMLTV
# Part 1
# Source: https://github.com/XMLTV/xmltv/blob/master/.Dockerfile.centos-8

FROM centos:8

RUN dnf -y --nogpgcheck install epel-release dnf-plugins-core && \
    dnf config-manager --set-enabled PowerTools epel

RUN dnf -y install \
    make \
    perl-core \
    perl-Archive-Zip \
    perl-Data-Dump \
    perl-Date-Calc \
    perl-Date-Manip \
    perl-DateTime \
    perl-DateTime-Format-ISO8601 \
    perl-DateTime-Format-SQLite \
    perl-DateTime-Format-Strptime \
    perl-DBD-SQLite \
    perl-DBI \
    perl-File-chdir \
    perl-File-HomeDir \
    perl-File-Slurp \
    perl-File-Which \
    perl-HTML-Parser \
    perl-HTML-Tree \
    perl-HTTP-Cache-Transparent \
    perl-HTTP-Cookies \
    perl-HTTP-Message \
    perl-IO-stringy \
    perl-JSON \
    perl-JSON-XS \
    perl-libwww-perl \
    perl-Lingua-Preferred \
    perl-List-MoreUtils \
    perl-LWP-Protocol-https \
    perl-LWP-UserAgent-Determined \
    perl-PerlIO-gzip \
    perl-SOAP-Lite \
    perl-Term-ProgressBar \
    perl-TermReadKey \
    perl-TimeDate \
    perl-Tk \
    perl-Tk-TableMatrix \
    perl-Try-Tiny \
    perl-Unicode-String \
    perl-URI \
    perl-XML-DOM \
    perl-XML-LibXML \
    perl-XML-LibXSLT \
    perl-XML-Parser \
    perl-XML-Simple \
    perl-XML-TreePP \
    perl-XML-Twig \
    perl-XML-Writer 

#Part 2 - maintainer kibuan

WORKDIR /usr/src/app

RUN yum -y install git

COPY install-xmltv.sh .

RUN chmod +x /usr/src/app/install-xmltv.sh \
    && /usr/src/app/install-xmltv.sh

ENTRYPOINT exec /usr/src/app/grab.sh

COPY grab.sh .
RUN chmod +x /usr/src/app/grab.sh
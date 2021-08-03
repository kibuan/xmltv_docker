# Dockerfile to generate CentOS 8 build container for XMLTV
# Part 1
# Source: https://github.com/xmltv/xmltv/blob/master/ci/Dockerfile.centos-8


FROM centos:8

RUN dnf -y --nogpgcheck install epel-release dnf-plugins-core && \
    dnf config-manager --set-enabled powertools epel

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
    perl-URI-Encode \
    perl-XML-DOM \
    perl-XML-LibXML \
    perl-XML-LibXSLT \
    perl-XML-Parser \
    perl-XML-Simple \
    perl-XML-TreePP \
    perl-XML-Twig \
    perl-XML-Writer

#Part 2 - maintainer kibuan

RUN dnf -y install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm &&\
    dnf -y install xmltv

RUN curl -o /bin/tv_grab_dk_meetv https://sourceforge.net/p/xmltvdk/code/194/tree/trunk/tv_grab_dk_meetv?format=raw &&\
    chmod +x /bin/tv_grab_dk_meetv

WORKDIR /usr/src/app

ENTRYPOINT exec /usr/src/app/grab.sh

COPY grab.sh .
RUN chmod +x /usr/src/app/grab.sh
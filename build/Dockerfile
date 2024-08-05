# Dockerfile to generate Fedora 40 build container for XMLTV
# Part 1
# Source: https://github.com/xmltv/xmltv/blob/master/ci/Dockerfile.fedora-40

FROM fedora:40

RUN yum -y install \
    make \
    perl \
    perl-Archive-Zip \
    perl-CGI \
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
    perl-Log-TraceMessages \
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

RUN yum -y install --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm &&\
    yum -y install xmltv

WORKDIR /usr/src/app

ENTRYPOINT exec /usr/src/app/grab.sh

COPY grab.sh .
RUN chmod +x /usr/src/app/grab.sh

COPY tv_grab_dk_meetv /bin/tv_grab_dk_meetv
RUN chmod +x /bin/tv_grab_dk_meetv

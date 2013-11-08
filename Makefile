NAME="nvdXjira"
MANPAGES="${NAME}.1"
VERSION=$(shell sed -n -e 's/version = (\([0-9]*\), \([0-9]*\), \([0-9]*\))/\1.\2.\3/p' setup.py)
BUILDHOST=""

help:
	@echo "The following targets are available:"
	@echo "build      build the RPM of ${NAME}-${VERSION} on ${BUILDHOST}"
	@echo "clean      remove any interim files"
	@echo "help       print this help"
	@echo "install    install nvd2sqlite3"
	@echo "rpm        build an RPM"
	@echo "uninstall  uninstall nvd2sqlite3"

build:
	@ssh ${BUILDHOST} "mkdir -p ${NAME}"
	@rsync -e ssh -avz . ${BUILDHOST}:${NAME}/.
	@ssh ${BUILDHOST} "cd ${NAME} && make rpm"
	@scp ${BUILDHOST}:${NAME}/dist/${NAME}-${VERSION}*rpm /tmp/
	@ls /tmp/${NAME}-${VERSION}*

install: man-compress
	python setup.py install

uninstall:
	@echo "Sorry, setup.py apparently can't do that."
	@echo "Your best bet is to run 'python setup.py install --record /tmp/f'"
	@echo "followed by 'xargs rm -f </tmp/f'"

rpm: man-compress
	python setup.py bdist_rpm --python=/usr/bin/python2.7

man-compress:
	@for f in ${MANPAGES}; do			\
		gzip -9 doc/$${f} -c > doc/$${f}.gz;	\
	done;

clean:
	rm -fr build dist doc/*.gz

MANPAGES=nvdXjira.1

help:
	@echo "The following targets are available:"
	@echo "build      build the RPM on opsnest1"
	@echo "clean      remove any interim files"
	@echo "help       print this help"
	@echo "install    install nvd2sqlite3"
	@echo "rpm        build an RPM"
	@echo "uninstall  uninstall nvd2sqlite3"

build:
	@rsync -e ssh -avz . opsnest1:nvdXjira/.
	@ssh opsnest1 "cd nvdXjira && make rpm"
	@scp opsnest1:nvdXjira/dist/*rpm /tmp/

install: man-compress
	python setup.py install

uninstall:
	@echo "Sorry, setup.py apparently can't do that."
	@echo "Your best bet is to run 'python setup.py install --record /tmp/f'"
	@echo "followed by 'xargs rm -f </tmp/f'"

rpm: man-compress
	python setup.py bdist_rpm --python=/usr/bin/python2.6

man-compress:
	@for f in ${MANPAGES}; do			\
		gzip -9 doc/$${f} -c > doc/$${f}.gz;	\
	done;

clean:
	rm -fr build dist doc/*.gz

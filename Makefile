Project               = X11libs
UserType              = Administrator
ToolType              = Commands

OSV = $(DSTROOT)/usr/local/OpenSourceVersions
OSL = $(DSTROOT)/usr/local/OpenSourceLicenses
MKDIR = /bin/mkdir -p
INSTALL = /usr/bin/install -c

install::
	@echo "Building $(Project)..."
	./build install
	$(MKDIR) $(OSV)
	$(INSTALL) $(SRCROOT)/$(Project).plist $(OSV)/$(Project).plist
	$(MKDIR) $(OSL)
	$(INSTALL) $(SRCROOT)/libpng.txt $(OSL)/libpng.txt
	chown -R root:wheel $(DSTROOT)/usr/X11/share/doc/

clean::
	@echo "Cleaning $(Project)..."
	./build clean

Install_Target  = install
Install_Flags   = DESTDIR=$(DSTROOT)

installsrc:
	@echo calling make $@
	find . -name ".#*" | xargs rm
	cp Makefile build uvn X11libs.plist libpng.txt $(SRCROOT)
	./build $@

installhdrs:
	echo "make: installhdrs"

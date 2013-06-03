Cross-referencing CVEs from the NVD with Jira
=============================================
In order to track CVEs within an organization, it may be useful to cross-
reference your ticket tracking system with NIST's National Vulnerability
Database.  The 'nvdXjira' utility allows you to do just that for the Jira
Ticket Tracking system.

In order to use 'nvdXjira', you need to have a local sqlite3 database with
the NVD data.  The 'nvd2sqlite3' tool creates such a database and is
recommend to be used to keep that data up to date.

FAQ
===

What are the dependencies?
--------------------------
'nvdXjira' is written in python, using only modules included in the base
distribution.  In particular, it uses the 'sqlite3' module to populate the
local database.

python < 2.6 probably isn't going to be sufficient, though.

How do I install 'nvdXjira'?
-------------------------------
'nvdXjira' comes with a standard python 'setup.py' file, so you should
be able to just run 'python setup.py install'.

How do I use it?
----------------
Create a configuration file for 'nvdXjira', specifying the Jira URL,
default project, and login credentials:

  username = cvebot
  password = supahs3kret
  project = VULN
  url = https://jira.your.domain

Assuming you have an sqlite3 database as created using the 'nvd2sqlite3'
utility in the file '/var/db/cvedb/nvd.db', you'd list all tickets by CVE
by running:

  $ nvdXjira -d /var/db/cvedb/nvd.db
  CVE-2012-4464: VULN-8480 VULN-8481 VULN-8482
  CVE-2012-4466: VULN-8481 VULN-8482
  CVE-2012-4952: VULN-8485
  CVE-2012-5218: VULN-8483
  CVE-2012-5219: No tickets.found.
  CVE-2012-5220: VULN-8487
  CVE-2012-5221: VULN-8488
  CVE-2012-5945: No tickets found.
  CVE-2012-5946: No tickets found.

Then, to create tickets for CVEs not yet tracked:

  $ nvdXjira -n -d /var/db/cvedb/nvd.db
  CVE-2012-5219: VULN-8489
  CVE-2012-5945: VULN-8490
  CVE-2012-5946: VULN-8491

Please see the manual page for details.

Who wrote this tool?
--------------------
'nvdXjira' was originally written by Jan Schaumann (jschauma@netmeister.org)
in May 2013.

Cross-referencing CVEs from the NVD with Jira
=============================================
In order to track CVEs within an organization, it may be useful to cross-
reference your ticket tracking system with NIST's National Vulnerability
Database.  The 'nvdXjira' utility allows you to do just that for the Jira
Ticket Tracking system.

'nvdXjira' reads NVD XML data and cross-references CVEs found in the input
with a Jira instance.

FAQ
===

What are the dependencies?
--------------------------
'nvdXjira' is written in python, using only modules included in the base
distribution.

python < 2.6 probably isn't going to be sufficient, though.

How do I install 'nvdXjira'?
-------------------------------
'nvdXjira' comes with a standard python 'setup.py' file, so you should
be able to just run 'python setup.py install'.

How do I use it?
----------------
Create a configuration file for 'nvdXjira', specifying the Jira URL,
default project, and login credentials:

```
username = cvebot
password = supahs3kret
project = VULN
url = https://jira.your.domain
```

To create new tickets for any CVEs found in the most recent data from NIST
using the 'security' project and tagging each ticket using the 'nvd'
label:

```
curl https://nvd.nist.gov/static/feeds/xml/cve/nvdcve-2.0-recent.xml |  \
        nvdXjira -p security -t nvd
```

Please see the manual page for details.

Who wrote this tool?
--------------------
'nvdXjira' was originally written by Jan Schaumann (jschauma@twitter.com) in
May 2013.

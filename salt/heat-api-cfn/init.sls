# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  heat-common

heat-api-cfn:
  pkg.installed:   []
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - reload:      True
    - watch:
      - pkg:       heat-api-cfn
#     - file:     /etc/heat/api-paste.ini
      - file:     /etc/heat/heat.conf
#     - file:     /etc/heat/policy.json

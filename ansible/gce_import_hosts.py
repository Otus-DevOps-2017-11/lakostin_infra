#!/usr/bin/python
import googleapiclient.discovery
import sys
import json

if len(sys.argv) == 2 and (sys.argv[1] == '--list'):

    compute = googleapiclient.discovery.build('compute', 'v1')

    project = 'infra-189120'
    zone = 'europe-west1-b'

    def list_instances(compute, project, zone):
        result = compute.instances().list(project=project, zone=zone).execute()
        return result['items']

    instances = list_instances(compute, project, zone)

    # print('Instances in project %s and zone %s:' % (project, zone))
    # for instance in instances:
    #     print(instance['name'],instance['networkInterfaces'][0]['accessConfigs'][0]['natIP'])

    a =    ('''{
      "app": {
        "hosts": ["%s"],
        "vars": {
          "ansible_host": "%s"
        }
      },
      "db": {
        "hosts": ["%s"],
        "vars": {
          "ansible_host": "%s"
        }
      }
    }''' % (instances[0]['name'], instances[0]['networkInterfaces'][0]['accessConfigs'][0]['natIP'], instances[1]['name'], instances[1]['networkInterfaces'][0]['accessConfigs'][0]['natIP']))

    parsed = json.loads(a)

    with open('data.json', 'w') as outfile:
              json.dump(parsed, outfile, indent=4, sort_keys=True)

    print(json.dumps(parsed))

else:
     print "Use: %s --list" % sys.argv[0]


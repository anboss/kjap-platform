import re

#extract project and namespace from project url
def extract_fields_from_repo_url(repository_url):
  matches = re.search(r'([a-z]+):\/\/([^/]*)\/([^/]*)\/(.*)\.git', repository_url)
  protocol = matches.group(1)
  domain = matches.group(2)
  name_space = matches.group(3)
  project = matches.group(4)

  return {'protocol':protocol, 'domain':domain, 'name_space':name_space, 'project': project}

fields = extract_fields_from_repo_url('https://gitlab.com/gitlab-org/gitlab-ce.git')

print (fields)

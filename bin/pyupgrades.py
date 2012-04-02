#!/usr/bin/env python

import xmlrpclib
import pip
import argparse
import re
from pkg_resources import parse_version

def version_number_compare(version1, version2):
    return cmp(parse_version(version1), parse_version(version2))
    
    def normalize(v):
        return [int(x) for x in re.sub(r'(\.0+)*$','', v).split(".")]
    return cmp(normalize(version1), normalize(version2))

package_format = '{dist.project_name} {dist.version}'
display_format = '{package:40} {message}'

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('-a', '--all', dest='all', action='store_true', default=False)
    parser.add_argument('-m', '--mirror', dest='mirror', default='http://pypi.python.org/pypi')
    
    args = parser.parse_args()
    
    if not args:
        exit(-1)
    
    pypi = xmlrpclib.ServerProxy(args.mirror)
    for dist in pip.get_installed_distributions():
        package_str = package_format.format(dist=dist)
        
        available = pypi.package_releases(dist.project_name)
        if not available:
            # Try the capitalized package name
            available = pypi.package_releases(dist.project_name.capitalize())
        
        upgrade_available = True
        if not available:
            print display_format.format(package=package_str, message='no releases at pypi')
            continue
        
        comparison = version_number_compare(available[0], dist.version)
        if comparison == 0:
            if not args.all:
                continue
            print display_format.format(package=package_str, message='up to date')
        elif comparison < 0:
            print display_format.format(package=package_str, message='older version on pypi')
        else:
            print display_format.format(package=package_str, message='%s available' % available[0])

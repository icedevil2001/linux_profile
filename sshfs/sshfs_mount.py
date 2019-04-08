#!/usr/bin/env python

import os
import sys
import argparse
import json
import shutil

f =  os.path.dirname(os.path.realpath(__file__))
with open(os.path.join(f,'sshfs_config.json')) as js:
    conf = json.load(js)

def checks():
    def _sshfs_install():
        from platform import system
        
        if system.lower()  == 'darwin': ## macos
            return 'You can install SSHFS on Mac OSX. You will need to download FUSE and SSHFS from the\n https://osxfuse.github.io/'
        elif system.lower() == 'linux':
            return 'apt-get update && apt-get upgrade \n sudo apt-get install sshfs'
        elif system.lower() == 'windows':
            return 'google sshfs for windows'
        else:
            raise ValueError('Could not detemine your OS: {}'.format(uname[0]))
            
    if not shutil.which('sshfs'):
        raise Error('Please install sshfs:\n  {}'.format(_sshfs_install())) 
    
def runcmd(cmd, dry_run=True):
    print(cmd)
    if not dry_run:
        return os.system(cmd)


parser = argparse.ArgumentParser(description='mount with remote host via sshfs')
parser.add_argument('--host',
        required = False,
        metavar = "STR",
        default = 'lin00',
        help = 'hostname ie usename@servername or servername')


parser.add_argument('--remote_path', "-r",
        required = False,
        metavar = "STR",
        default = '/home/OXFORDNANOLABS/prughani/',
        help = 'path on the remote host')

parser.add_argument('--name', '-n',
        required = False,
        metavar = "STR",
        default = None,
        help = 'name of mount / volname')
        
parser.add_argument('--location', '-l', 
        required = False,
        metavar = "DIR",
        default = None,
        help = 'mount location')
        
parser.add_argument('--setting', '-s', 
        required = False,
        metavar = "STR",
        default = "default",
        help = 'setting to use from .sshfs_config.json')
        
parser.add_argument('--dry_run', '-d', 
        required = False,
        action = 'store_true',
        help = 'dry run')



args = parser.parse_args()
print(args)


if args.location:
    location = args.location
else:
    location = conf[args.setting]['location']
    
if args.name is None:
    try: 
        usename, hostname = args.host.split('@')
        hostname = hostname.replace('.', '_')
    except:
        hostname =args.host
    mount_path= os.path.join(location, hostname)
    args.name = hostname
else: 
    mount_path= os.path.join(location, args.name)


print(mount_path)
if not os.path.exists(mount_path):
    os.makedirs(mount_path)
else:
    runcmd('umount -fv {}'.format(mount_path), dry_run=args.dry_run)
    
runcmd('sshfs {}:{} {} -o {},volname={} '.format(args.host, args.remote_path, mount_path, ','.join(conf[args.setting]['o']),args.name), dry_run=args.dry_run)


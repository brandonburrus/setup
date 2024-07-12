#! /usr/bin/python3
from dataclasses import dataclass
from importlib.resources import path
from typing import List
import argparse
import logging
import os
import pathlib
import shutil

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger('install')

HOME_DIR = os.path.expanduser('~')

@dataclass
class InstallTargetDir:
    origin_dir: str
    dest_dir: str

    def do_install(self, dry_run: bool = False):
        src = pathlib.Path(self.origin_dir).resolve()
        dst = pathlib.Path(self.dest_dir).resolve()
        if dst.exists():
            log.debug('rmdir %s', dst)
            if not dry_run:
                shutil.rmtree(dst)
        log.debug('copy %s -> %s', src, dst)
        if not dry_run:
            shutil.copytree(src=self.origin_dir, dst=self.dest_dir)


@dataclass
class InstallTargetFile:
    origin_file: str
    dest_file: str

    def do_install(self, dry_run: bool = False):
        src = pathlib.Path(self.origin_file).resolve()
        dst = pathlib.Path(self.dest_file).resolve()
        if dst.exists():
            log.debug('rm %s', dst)
            if not dry_run:
                os.remove(dst)
        log.debug('copy %s -> %s', src, dst)
        if not dry_run:
            shutil.copyfile(src, dst, follow_symlinks=False)


@dataclass
class InstallManifest:
    targets: List[InstallTargetDir | InstallTargetFile]

    def do_install(self, dry_run: bool = False):
        for target in self.targets:
            log.debug('working on target = %s', target)
            target.do_install(dry_run)


MANIFEST = InstallManifest(targets=[
    InstallTargetDir(origin_dir='./nvim', dest_dir=os.path.join(HOME_DIR, '.config/nvim')),
    InstallTargetDir(origin_dir='./scripts', dest_dir=os.path.join(HOME_DIR, '.scripts')),
    InstallTargetFile(origin_file='./zshrc', dest_file=os.path.join(HOME_DIR, '.zshrc')),
    InstallTargetFile(origin_file='./tmux.conf', dest_file=os.path.join(HOME_DIR, '.tmux.conf')),
    InstallTargetFile(origin_file='./aliases', dest_file=os.path.join(HOME_DIR, '.aliases')),
    InstallTargetFile(origin_file='./gitconfig', dest_file=os.path.join(HOME_DIR, '.gitconfig')),
])


def configure_arg_parser() -> argparse.Namespace:
    cmdline = argparse.ArgumentParser(description='convenience installation script for dotfiles configs')
    cmdline.add_argument('--dry-run', action='store_true', help='run the installation in dry-run mode')
    cmdline.add_argument('--skip-brewfile', action='store_true', help='skip running app installation via brewfile')
    cmdline.add_argument('--skip-nvim', action='store_true', help='skip install nvim plugins and required pre-requisites')

    return cmdline.parse_args()


if __name__ == '__main__':
    args = configure_arg_parser()
    log.debug('parsed args = %s', args)
    log.debug('manifest = %s', MANIFEST)

    log.info('running manifest install...')
    MANIFEST.do_install(args.dry_run)

    if shutil.which('brew') is None:
        log.info('installing brew...')
        if not args.dry_run:
            os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')

    if not args.skip_brewfile:
        log.info('running Brewfile...')
        if not args.dry_run:
            os.system('brew bundle')

    if not args.skip_nvim:
        log.info('install nvim plugins...')
        if not args.dry_run:
            # https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            # os.system('go install golang.org/x/tools/gopls@latest')
            # os.system('go install github.com/bufbuild/buf-language-server/cmd/bufls@latest')
            # os.system('pip install python-lsp-server')
            # os.system('npm install -g typescript typescript-language-server sql-language-server bash-language-server vscode-langservers-extracted dockerfile-language-server-nodejs emmet-ls graphql-language-service-cli')
            os.system('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
            os.system('nvim +PlugInstall +qall')

# devops-netology-dogoter

# Домашнее задание к занятию «Инструменты Git»

## Задание 1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

```
git show aefea --no-patch --pretty=format:"%H %s"
aefead2207ef7e2aa5dc81a34aedf0cad4c32545 Update CHANGELOG.md 
```

## Задание 2. Ответьте на вопросы.

1. Какому тегу соответствует коммит 85024d3?
```
git tag --points-at 85024d3
v0.12.23
```
2. Сколько родителей у коммита b8d720? Напишите их хеши.

2 Родителя
```
git show --no-patch --pretty=raw b8d720

parent 56cd7859e05c36c06b56d013b55a252d0bb7e158
parent 9ea88f22fc6269854151c571162c5bcf958bee2b
```
3. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
```
git log --pretty=format:"%H %s" v0.12.23..v0.12.24
33ff1c03bb960b332be3af2e333462dde88b279e v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release
```
4. Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).
```
git log -S "func providerSource(" --oneline
8c928e8358 main: Consult local directories as potential mirrors of providers
```
5. Найдите все коммиты, в которых была изменена функция globalPluginDirs.
```
git log -S "func globalPluginDirs" --oneline
7c4aeac5f3 stacks: load credentials from config file on startup (#35952)
8364383c35 Push plugin discovery down into command package
```
6. Кто автор функции synchronizedWriters?

Martin Atkins
```
git log -S "func synchronizedWriters" --pretty=format:"%H %an %ae %ad"
bdfea50cc85161dea41be0fe3381fd98731ff786 James Bardin j.bardin@gmail.com Mon Nov 30 18:02:04 2020 -0500
5ac311e2a91e381e2f52234668b49ba670aa0fe5 Martin Atkins mart@degeneration.co.uk Wed May 3 16:25:41 2017 -0700
```
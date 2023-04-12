# Git, Docker and Kubernetes shell helpers

v0.6.0 - back to the sh

## Usage

```
cd ~
git clone https://github.com/mhio/short.git
```

`d` `g` and `k` scripts are supplied:
```
~/short/d run -ti --rm docker.io/debian echo it is $(date)
```

Or source the main scripts and create alias entries to the shortcuts (like `d`) in an rc file
```
# short docker, kubectl, git https://github.com/mhio/short
source ~/short/docker.sh
alias d=dockerShort
source ~/short/kubectl.sh
alias k=kubectlShort
source ~/short/git.sh
alias g=gitShort
```

Then run
```
g s
d ps
k g all
```

## Git

```
$ g h
the (g)it function - g (a b c d l s)
 g a(dd)
 g b(ranch)
 g c(ommit)
 g d(iff)
 g l(og)
 g s(tatus)
```

## Docker

```
$ d h
the (d)ocker function - d (b r c i n v)
 d b(uild)
 d r(un)
 d c(ontainer)
 d i(mage)
 d psa      List all
 d rme      Remove Exited/Created
 d rmin     Remove <none> images
```

## Kubernetes

```
the (k)ubectl function - k ()
 k c(reate)
 k a(pply)
 k r(un)
 k s(et)
 k g(get)
 k d(escribe)
 k e(dit)
 k del(ete)
 k l(ogs)
 k ex(ec)
 k api-v(ersion)
 k api-r(esources)
```

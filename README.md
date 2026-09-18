# React Zenék

Ez egy egyszerű React projekt, ami különböző zenéket jelenít meg kártyák formájában.

A projekt **React**, **TypeScript** és **Vite** használatával készült.

## Az oldal

A zenékhez az alábbi adatok jelennek meg:

* cím
* előadó
* műfaj
* borítókép

Az oldal itt érhető el:

https://vikierdos.github.io/zenek/

## Felépítés

A zenék adatai az `adat.tsx` fájlban vannak eltárolva.

A megjelenítéshez két komponenst használ a projekt:

* `Zenek.tsx` – végigmegy a zenék listáján
* `Zene.tsx` – egy zene adatait jeleníti meg

Az `App.tsx` adja át a teljes listát a `Zenek` komponensnek.

## Használt technológiák

* React
* TypeScript
* Vite
* CSS
* GitHub Pages

## Projekt futtatása

A repository klónozása:

```bash
git clone https://github.com/vikierdos/zenek.git
```

Belépés a mappába:

```bash
cd zenek
```

Csomagok telepítése:

```bash
npm install
```

Fejlesztői szerver indítása:

```bash
npm run dev
```

## Build

A kész verzió létrehozása:

```bash
npm run build
```

A build a `dist` mappába kerül.

## GitHub Pages

A projekt GitHub Actions segítségével automatikusan feltöltődik GitHub Pages-re, amikor változás kerül a `main` branch-re.

A workflow fájl:

```text
.github/workflows/deploy.yml
```

A Vite beállításban a projekt útvonala:

```ts
base: '/zenek/'
```

## Készítette

Erdős Viki

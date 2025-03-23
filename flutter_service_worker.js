'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5f7a93039121cb0c7a7f94a5604dfcd6",
"version.json": "15235b5108d6a877ef74fe3317a96bf7",
"index.html": "71d35416f0cebbd6f750305390a41dec",
"/": "71d35416f0cebbd6f750305390a41dec",
"images/maps/mariana_trench.png.jpg": "9b25bf63d99a15ebff2745db1f80db8c",
"images/maps/guatemala_map.png": "de1b3a0228154ac129fda8e7c0c9e1fb",
"images/maps/afghanistan_map.png.jpg": "ea9ae821196617227f734525fac093a4",
"images/maps/oceania_map.png": "7a810e27ef5d738ecf1898d633362277",
"images/maps/cameroon_map.png.jpg": "fef6bb5d7ba8e9c13e732c34dca322e3",
"images/maps/sahara_desert.png.jpg": "58b0745478d2d9ea63599b9f6f3bf31c",
"images/maps/lake_baikal.png": "201ba949a9d44043fe0647ab2aca6513",
"images/maps/japan_map.png": "a2f4324854852b561f27b0198b47a095",
"images/capitals/paris.jpg": "3c3f0c7f89bf5b54d5c4defc315a5d1c",
"images/capitals/tokyo.png.jpg": "dd795c72c8c0bb40a18b3bb838b2f418",
"images/capitals/canberra.png.jpg": "4bb89b28ba8d954bd966b9dee73bb2f9",
"images/capitals/ashgabat.jpg": "84962b523511bc7f1b95d9b0a32e0f9c",
"images/capitals/damascus.png": "a2a7658fa6fef08a76b3d4a1f8e1e4f1",
"images/capitals/vatican.png.jpeg": "6913de3f93f292b582dfaf8a1666a884",
"images/capitals/rwanda_capital.png": "bb1526fb4c49acfa8b488dd7bc7acc82",
"images/flags/japan_flag.png": "8455c825898aff225e7a3e7e7509de69",
"images/flags/saudi_arabia_flag.png": "90cc910387ce9329aa4a380a49ae7476",
"images/flags/brazil_flag.png": "34389993989fba877df1a7f9ba79c0d3",
"images/flags/canada_flag.png.jpg": "a8062e649372e07ca9c9656f5ac698cd",
"images/flags/luxembour_flag.png": "3d39375314b848e6574e605b7685608f",
"main.dart.js": "80fa7665ef0cde5fd9878e19d2bbf2e1",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fd091ea5bc8f3ccc10f74bd67179fb6a",
"assets/AssetManifest.json": "d5be7cb7858761d11af80a5b83f283d3",
"assets/NOTICES": "4a804c47a0471f06edd264784c10d074",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "c912d602894dfe0705a14b92a5320ad3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "88df2def39897c14593d8f96d7b20f7f",
"assets/fonts/MaterialIcons-Regular.otf": "9d27c28fd7ca9687140c2797181006e2",
"assets/assets/assets/images/maps/mariana_trench.png.jpg": "9b25bf63d99a15ebff2745db1f80db8c",
"assets/assets/assets/images/maps/guatemala_map.png": "de1b3a0228154ac129fda8e7c0c9e1fb",
"assets/assets/assets/images/maps/afghanistan_map.png.jpg": "ea9ae821196617227f734525fac093a4",
"assets/assets/assets/images/maps/oceania_map.png": "7a810e27ef5d738ecf1898d633362277",
"assets/assets/assets/images/maps/cameroon_map.png.jpg": "fef6bb5d7ba8e9c13e732c34dca322e3",
"assets/assets/assets/images/maps/sahara_desert.png.jpg": "58b0745478d2d9ea63599b9f6f3bf31c",
"assets/assets/assets/images/maps/lake_baikal.png": "201ba949a9d44043fe0647ab2aca6513",
"assets/assets/assets/images/maps/japan_map.png": "a2f4324854852b561f27b0198b47a095",
"assets/assets/assets/images/capitals/paris.jpg": "3c3f0c7f89bf5b54d5c4defc315a5d1c",
"assets/assets/assets/images/capitals/tokyo.png.jpg": "dd795c72c8c0bb40a18b3bb838b2f418",
"assets/assets/assets/images/capitals/canberra.png.jpg": "4bb89b28ba8d954bd966b9dee73bb2f9",
"assets/assets/assets/images/capitals/ashgabat.jpg": "84962b523511bc7f1b95d9b0a32e0f9c",
"assets/assets/assets/images/capitals/damascus.png": "a2a7658fa6fef08a76b3d4a1f8e1e4f1",
"assets/assets/assets/images/capitals/vatican.png.jpeg": "6913de3f93f292b582dfaf8a1666a884",
"assets/assets/assets/images/capitals/rwanda_capital.png": "bb1526fb4c49acfa8b488dd7bc7acc82",
"assets/assets/assets/images/flags/japan_flag.png": "8455c825898aff225e7a3e7e7509de69",
"assets/assets/assets/images/flags/saudi_arabia_flag.png": "90cc910387ce9329aa4a380a49ae7476",
"assets/assets/assets/images/flags/brazil_flag.png": "34389993989fba877df1a7f9ba79c0d3",
"assets/assets/assets/images/flags/canada_flag.png.jpg": "a8062e649372e07ca9c9656f5ac698cd",
"assets/assets/assets/images/flags/luxembour_flag.png": "3d39375314b848e6574e605b7685608f",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

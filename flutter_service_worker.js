'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "db57de57055b8734fe2a67c13dea8af0",
"index.html": "2eee0d178a8538e3cff9eebbb95cc4ea",
"/": "2eee0d178a8538e3cff9eebbb95cc4ea",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "e197cd042e61ba3a3c732abe3ec4b1fa",
"assets/assets/rbx-screens/weco-welder-end.png": "259ae1113f6b3bb9e84c7e2a7a246b53",
"assets/assets/rbx-screens/extension-multipass-pout.png": "bed13cd0f67079584151c565b101ab3f",
"assets/assets/rbx-screens/rbx-analog-set-welder.png": "a3af5bf23d3dd8bbd4f30f18386da6b8",
"assets/assets/rbx-screens/kemppi-weld-adjust.png": "b8292a210817ea0a49437fa8988a9b0b",
"assets/assets/rbx-screens/weco-example.png": "fb74999bf98e418a00cb6fe25806ff41",
"assets/assets/rbx-screens/extension-weld-adjust.png": "94db0941f9c45d1293090aa9c8fba840",
"assets/assets/rbx-screens/imt-welder-end.png": "357bf0aa1d0311e6da164a9a0a8add33",
"assets/assets/rbx-screens/maven-systemset.png": "ed6c5be1cb3e0fc8e79736f8df473619",
"assets/assets/rbx-screens/rbx-jog-pitch.png": "43a18e13599390f7e019135235cb2381",
"assets/assets/rbx-screens/tool-ioteste-input.png": "142eeacdfae789584b212a753c01aba9",
"assets/assets/rbx-screens/tool-iotester-output.png": "2ee82f3060d1fdc4bd51c69f3e0f8e5d",
"assets/assets/rbx-screens/jog-control.png": "1649c3de8b481daa8ea8c651de687721",
"assets/assets/rbx-screens/maven-welder-laserpowerrange.png": "45cf86079cef9b8152000d0c6a4239be",
"assets/assets/rbx-screens/kemppi-systemset.png": "3c9861823833dd8f9d81dea898767262",
"assets/assets/rbx-screens/movel_steps_outofarc.png": "d3d735e46246ac0d4eab4a54ffcc0403",
"assets/assets/rbx-screens/rbx-jog-smooth.png": "07edb8baa7ef45db9217279beae8a804",
"assets/assets/rbx-screens/imt-welder-volt-ch.png": "d63e5818ff2e98bd2964ce93b6195834",
"assets/assets/rbx-screens/rbx-jog-pitch-set.png": "d4d4f309294b4738568ca80532fac46e",
"assets/assets/rbx-screens/rbx-analog-set-end.png": "26d2951f93f48067fc0848b7ac6a929c",
"assets/assets/rbx-screens/rbx-program-view.png": "f8e544f412ac69461d1143a837a7f4c9",
"assets/assets/rbx-screens/tool-scheduler.png": "d19664ddea62c468b8331858ebc66fd9",
"assets/assets/rbx-screens/tool-scheduler-button-map.png": "42c6b940701528c7b51d1365315099e5",
"assets/assets/rbx-screens/extension-ext-axis.png": "9f61aced6f81c020a1abf9f80f3d4d38",
"assets/assets/rbx-screens/batch-weld-mod.png": "2d59bd3b7dcd35a4ac944b05b11904a6",
"assets/assets/rbx-screens/kemppi-example.png": "753afbd60b2f8c8bfca27edcae0d9290",
"assets/assets/rbx-screens/data-transfer-execute.png": "a7e977ecd559855aaca6343cbc8a709c",
"assets/assets/rbx-screens/rbx-tcpset-auto2.png": "aa835e0b406f4d0c3aa3a185dc20d0c2",
"assets/assets/rbx-screens/imt-welder-curr-ch.png": "8cc2b5364881f51777721c05db931f59",
"assets/assets/rbx-screens/maven-example.png": "3c853173b077af59ca1346718e7ad102",
"assets/assets/rbx-screens/systemset-data-transfer.png": "cfd9d8fa604436063727e69b74e1e94b",
"assets/assets/rbx-screens/rbx-jump.png": "e151f5fa6b67b69b1869401874be5c39",
"assets/assets/rbx-screens/weco-welder-jobmode.png": "244d1592ede6c7c10f8b18528092fa8b",
"assets/assets/rbx-screens/rbx-setup.png": "5e172f7c8a4bf17cf50756d3954ce220",
"assets/assets/rbx-screens/kemppi-welder-end.png": "3eee356c53ef13adacfed9419221b0a2",
"assets/assets/rbx-screens/rbx-tcpset-auto1.png": "312e1ecce94a828893ff5d1eee9e9c79",
"assets/assets/rbx-screens/movel_in_arc.png": "c3e945787241601e4bb4ebcde2eecab3",
"assets/assets/rbx-screens/movel_outof_arc.png": "5f9b109c0c62647a3eb3b985cd0901c7",
"assets/assets/rbx-screens/extension-da-output.png": "6507d9a20ad4153a262ac2d7fb08c53a",
"assets/assets/rbx-screens/imt-example.png": "2fca6940abbe2511f21cf66adff2a2e3",
"assets/assets/rbx-screens/rbx-analog-set-start.png": "cadce6cbe84bc83bec074e95fd89239e",
"assets/assets/rbx-screens/rbx-weaving.png": "0d3786567480b42111583a425e44bb88",
"assets/assets/rbx-screens/kemppi-mem-wo-adj.png": "d9b12ee876294b163bcd281b716987f0",
"assets/assets/rbx-screens/moveC-example.png": "a309013208c2433d2e4a864a8ee7a898",
"assets/assets/rbx-screens/imt-welder-start.png": "c671478ea9c5eb28263524d8c7dea104",
"assets/assets/rbx-screens/rbx-tcpset-manual.png": "3c48bcc149119bcd2ea3db150c142577",
"assets/assets/rbx-screens/rbx-jog-bottom.png": "18807b9f76716422abadc425fde38e69",
"assets/assets/rbx-screens/rbx-jog-middle.png": "c2243c56fc6a2808465c53ed7f68c36d",
"assets/assets/rbx-screens/extension-multipass-pout-example.png": "d6ce77dba178f4e6d3c76965de781148",
"assets/assets/rbx-screens/rbx-utility.png": "801160c8318c9fedd3dde5224a8a78ef",
"assets/assets/rbx-screens/movel_steps_inarc.png": "aba28ef1ca4424dd6401c4e251a0af60",
"assets/assets/rbx-screens/maven-welder-end.png": "762140e3ba6f591fc530e8f5f426eda8",
"assets/assets/rbx-screens/weco-systemset.png": "c2dabbcf6679af2ea758c3358c093bd9",
"assets/assets/rbx-screens/weco-welder-start.png": "0f1ac4790767407dfc0cbb7983fa4f74",
"assets/assets/rbx-screens/maven-welder-welder.png": "cb99f52eaeafc59d5f36f8547d45cf2d",
"assets/assets/rbx-screens/rbx-home.png": "d9637dcb76061ccb55b949386a313dbc",
"assets/assets/rbx-screens/imt-systemset.png": "c6b02240e954d02058436ba9590feb64",
"assets/assets/rbx-screens/kemppi-welder-start.png": "54df05bc63bfded4bf9f2e86fbf61d55",
"assets/assets/rbx-screens/imt-welder-welder.png": "d69186394569bbbd6a08a613b84ea82a",
"assets/assets/rbx-screens/maven-welder-start.png": "684aa319b551b969363f36c13be85f91",
"assets/assets/rbx-screens/rbx-shift.png": "198582ee4487059cac590a53829badca",
"assets/assets/rbx-screens/kemppi-manual.png": "971de428acc3cebedfd83bb6ef0ec37d",
"assets/assets/rbx-screens/maven-welder-feederspeedrange.png": "9f15db4fbecb2fb042c704000bb59b87",
"assets/assets/rbx-screens/kemppi-mem-w-adj.png": "f83cf24417a459acdd12f72a2cf33455",
"assets/assets/rbx-screens/extension-multipass.png": "763a064ad3608e5c78cb2a4c09c2caef",
"assets/fonts/MaterialIcons-Regular.otf": "91665b0371d6bc0ed98129d7593c73fe",
"assets/NOTICES": "4228c8097812f13e1218683325e0b3f4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "4267026392cd4796025dd73f6dfdfc9f",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "b5408de164da2a14f740ebae7dadd406",
"version.json": "965ca07249aabcb36e00b7290bcbfec7",
"main.dart.js": "b80319598b95e0b6037eeb9e77905cbb"};
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

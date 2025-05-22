'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "6d99e5b09a2afce7b93a1a1c49118364",
"version.json": "7804eb643eb875d188221832d4ff86c5",
"index.html": "c5efe22c0ecfe22904470b97a5b32462",
"/": "c5efe22c0ecfe22904470b97a5b32462",
"styles.css": "49d186a7c3f1756a90cd5103929383e6",
"main.dart.js": "5ab419bf507c34b5fe6a3e2d4416435d",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "f5b691d3b227a60ddbd183cd0c15c7f2",
"icons/Icon-192.png": "84a0ad6ac6935de1a373823bfd64a77f",
"icons/Icon-512.png": "ce55354092cde512fd8d7627c4472d35",
"manifest.json": "553d4c18acc14decedc953f89814a05c",
"build/web/index.html": "c5efe22c0ecfe22904470b97a5b32462",
"assets/AssetManifest.json": "400acce9906667c13a56985ebc07594a",
"assets/NOTICES": "a0ed6ab335b84bdd2d606fa408157afd",
"assets/FontManifest.json": "4404ddd2f14c22e430ed61cc9a8d884e",
"assets/AssetManifest.bin.json": "48f1215db124ba39853284b91ecfcf77",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "414396b5f85294b6c11284e59643a18c",
"assets/fonts/MaterialIcons-Regular.otf": "2560ef934303160dd599fc36f5193f04",
"assets/assets/images/uniwide.png": "479b950f9c324e501d88347c1a000834",
"assets/assets/images/neo_calc.png": "2ef5fbeb1e4050ed80546ce0942665be",
"assets/assets/images/space_game.png": "ab3cfdd4460ef08679e0c00a03583c87",
"assets/assets/images/trivia_right.png": "78fb3dd7b93b688d58f478f1e3830a1a",
"assets/assets/images/fly_1.png": "232b6e2472259e2358db17ca758c5336",
"assets/assets/images/sakif.jpg": "c10a3697e38329160b7ceac6ceec84df",
"assets/assets/images/fly_2.png": "40052eeea92fb7991f1cefea0f34c83d",
"assets/assets/images/web_2.png": "c2199bbdb521851fe42523ba38bdf17a",
"assets/assets/images/web_1.png": "b1752bb93609d334b61047f040c214a3",
"assets/assets/images/calc_python.png": "faf0cd1c057bb97c14f035de1b2671b0",
"assets/assets/images/portfolio.png": "4934a2f646b412467527809dfda08a66",
"assets/assets/images/daily_exp_right.png": "415bc315dc5ffbcb6458da2a692f4b33",
"assets/assets/images/peach_1.png": "32a4ff6e1a0888235390a351e21b9156",
"assets/assets/images/trivia_left.png": "3e6f9dfd1aaae22f2b9fbded946e6091",
"assets/assets/images/insta_clone_front.png": "492d1e277c0dad295c9cfa60d5e80ea6",
"assets/assets/images/insta_clone_right.png": "8c9be60b067867f100581f5485aa3a45",
"assets/assets/images/insta_clone_left.png": "630c09b97076e432fb0a82f408ac90e7",
"assets/assets/images/peach_2.png": "f144c1d003408c5395175496794903b6",
"assets/assets/images/daily_exp_left.png": "cbcb2f3a380b4a512d496432dd587ad2",
"assets/assets/images/lamp.png": "d745b087ce5d960c8d74fb278ab42bec",
"assets/assets/images/crafting_psyche.png": "6b62c43042c1661d855930aed5825f5b",
"assets/assets/logos/xampp.png": "9b281aea99e01ce60f43fd0472e5f3e7",
"assets/assets/logos/git.png": "5b2255699fcb506b570720cdbc8ade1b",
"assets/assets/logos/docker.png": "66bc6dac7656daa7250d47594f2b7cf7",
"assets/assets/logos/python.png": "6841951dd3623f17a3f6a880c3f4f0a0",
"assets/assets/logos/flutter.png": "8efb797d33c586ef3cb71d4083dd1fdb",
"assets/assets/logos/cpp.png": "b8a1078d92d851db2364d5e405a0649d",
"assets/assets/logos/sql.png": "82b460be75f200b65035b63f7bc57f47",
"assets/assets/logos/bash.png": "3f27b9776b897f2c672e875323a965f2",
"assets/assets/logos/firebase.png": "04aec5a53cd16f26a855e61aa5cd35b5",
"assets/assets/logos/java.png": "7013d3cd840b6bed9697daf954c4c3e2",
"assets/assets/logos/js.png": "d8b359bb45cbe32632e8fc7901b27615",
"assets/assets/logos/csharp.png": "e77e8ad819dc0a8b73b69635c2c74237",
"assets/assets/logos/cpanel.png": "f508c0839b21416a17c3d335f3b13a3b",
"assets/assets/logos/postman.png": "d73454ddf3399471fb4af186c7e3d4cc",
"assets/assets/logos/c.png": "11396a41fce307b10316e942e62d2d39",
"assets/assets/logos/php.png": "08bfd354a8b7fa5f5dcc386668ab6783",
"assets/assets/logos/dart.png": "918e7c35823c7ad268ba831c6e7eaa64",
"assets/assets/logos/lamp.png": "c36c7e7483167efa11efa04f8d7d43fe",
"assets/assets/icons/cursor.png": "027015c6114318373e94961b0994e62f",
"assets/assets/icons/github.svg": "8dcc6b5262f3b6138b1566b357ba89a9",
"assets/assets/icons/dot.svg": "83fea301d19ff10f55440c0e148ca269",
"assets/assets/icons/codeforces.svg": "ce3361ac52fe99b93f7da86dbf24367d",
"assets/assets/icons/linkedin.svg": "8f01e2669d4d1a141ccb4d03a62c98dd",
"assets/assets/icons/arrow_forward.svg": "0c73b9335a184d76882e57579c16459c",
"assets/assets/icons/arrow_backward.svg": "2637cb2dcfdcf545b92a44e61b44e1fb",
"assets/assets/Northwood_High.ttf": "236ef68fb3d955d8679169a60a719696",
"CV.pdf": "60a6a1a4303a045100e2bad5a4a5e5bc",
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

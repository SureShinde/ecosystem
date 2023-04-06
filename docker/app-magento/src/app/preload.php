<?php

/**
 * Opcache preload
 *
 * @param $preload
 * @param array $ignore
 * @param string $pattern
 *
 * @return void
 */
function preload($preload, array $ignore = [], string $pattern = "/\.php$/"): void
{
    if (is_array($preload)) {
        foreach ($preload as $path) {
            preload($path, $ignore, $pattern);
        }
    } else {
        if (is_string($preload)) {
            $path = $preload;
            if (!in_array($path, $ignore)) {
                if (is_dir($path)) {
                    if ($dh = opendir($path)) {
                        while (($file = readdir($dh)) !== false) {
                            if ($file !== "." && $file !== "..") {
                                preload($path . "/" . $file, $ignore, $pattern);
                            }
                        }
                        closedir($dh);
                    }
                } else {
                    if (is_file($path) && preg_match($pattern, $path)) {
                        if (!opcache_is_script_cached($path)) {
                            opcache_compile_file($path);
                        }
                    }
                }
            }
        }
    }
}

set_include_path(get_include_path() . PATH_SEPARATOR . realpath(__DIR__));

$preload = [
    __DIR__ . '/etc/config.php',
    __DIR__ . '/etc/env.php',
    dirname(__DIR__) . '/vendor/autoload.php',
    dirname(__DIR__) . '/vendor/composer/include_paths.php',
    dirname(__DIR__) . '/vendor/composer/autoload_static.php',
    dirname(__DIR__) . '/vendor/composer/autoload_real.php',
    dirname(__DIR__) . '/vendor/composer/autoload_psr4.php',
    dirname(__DIR__) . '/vendor/composer/autoload_namespaces.php',
    dirname(__DIR__) . '/vendor/composer/autoload_files.php',
    dirname(__DIR__) . '/vendor/composer/autoload_classmap.php',
];

if (getenv('MAGE_MODE') == 'production') {
    $preload[] = [
        dirname(__DIR__) . '/generated',
    ];
}

preload($preload);

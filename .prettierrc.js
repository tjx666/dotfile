module.exports = {
    endOfLine: 'auto',
    printWidth: 100,
    quoteProps: 'consistent',
    semi: true,
    singleQuote: true,
    tabWidth: 4,
    trailingComma: 'all',

    overrides: [
        // https://github.com/prettier/prettier/issues/5322#issuecomment-1276302630
        {
            files: '*.svg',
            options: {
                parser: 'html',
            },
        },
        {
            files: ['*.{yml,yaml,md}'],
            options: { tabWidth: 2 },
        },
    ],
};

// https://github.com/prettier/prettier-vscode/issues/3224
// module.exports = require(`${process.env.PNPM_GLOBAL_NODE_MODULES}/@yutengjing/prettier-config`);

// require('fs')
//     .writeFileSync('/Users/yutengjing/code/fe-demos/o.json', JSON.stringify(module.exports, null, 4), 'utf8')
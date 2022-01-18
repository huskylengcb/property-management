module.exports = {
  presets: ['@babel/preset-react', ['@babel/preset-env'], '@babel/preset-typescript'],
  plugins: [
    ['@babel/plugin-proposal-class-properties', { loose: false }],
    ['@babel/plugin-transform-modules-commonjs'],
    '@babel/transform-runtime',
  ],
};

#!/bin/bash

if [ -z "${PROJECT_NAME}" ]; then
  echo "You must a pass project name as parameter."
  cd ${ROOT_DIR}
  return 2
fi

# Check 
if [ -d "${PROJECT_NAME}" ]; then
  echo "'${PROJECT_NAME}' already exists!"
  return 2
fi

# Initialize the project
npx create-react-app ${PROJECT_NAME}
cd ${PROJECT_NAME}

# create .eslintrc
rm -rf ".eslintrc"
echo '{
    "extends":"react-app"
}' > .eslintrc

# create .babelrc
rm -rf ".babelrc"
echo '{
    "presets": ["@babel/preset-react", "@babel/preset-env"],
    "plugins": [["@babel/plugin-proposal-class-properties", { "loose": true }]]    
}' > .babelrc

# remove src directory and create
rm -rf src
mkdir src
cd src
mkdir ${PROJECT_NAME}
cd ${PROJECT_NAME}

# create component
rm -rf "'${COMPONENT}'.js"
echo '
import React from "react";

class '${COMPONENT}' extends React.Component {
  a_class_field = "Hello world";

  render() {
    return <div>{this.a_class_field}</div>;
  }
}

export default '${COMPONENT}';
' > ${COMPONENT}.js

# create index.js
rm -rf "index.js"
echo '
import '${COMPONENT}' from "./'${COMPONENT}'";
export { '${COMPONENT}' };
' > index.js

cd ..

# create index.js
rm -rf "index.js"
echo '
import React from "react";
import { render } from "react-dom";
import '${COMPONENT}' from "./'${PROJECT_NAME}'/'${COMPONENT}'";

const App = () => (
  <'${COMPONENT}'/>
);

render(<App />, document.getElementById("root"));
' > index.js

cd ..

# create package.json
rm -rf "package.json"
echo '
{
  "name": "'${PROJECT_NAME}'",
  "version": "0.1.0",
  "main": "'${PROJECT_NAME}'/index.js",
  "module": "'${PROJECT_NAME}'/index.js",
  "files": [
    "'${PROJECT_NAME}'"
  ],
  "scripts": {
    "start": "react-scripts start",
    "build-examples": "react-scripts build",
    "test": "react-scripts test --env=jsdom",
    "eject": "react-scripts eject",
    "build": "rimraf '${PROJECT_NAME}'  && NODE_ENV=production babel src/'${PROJECT_NAME}' --out-dir '${PROJECT_NAME}' --source-maps --copy-files --ignore __tests__,spec.js,test.js,__snapshots__",
    "watch":"watch '"'"'npm run build'"'"' ./src/'${PROJECT_NAME}'"
  },
  "dependencies": {
    "react": "^16.7.0",
    "react-dom": "^16.7.0",
    "react-scripts": "^2.1.3"
  },  
  "devDependencies": {
    "@babel/cli": "^7.2.3",
    "@babel/core": "^7.2.2",
    "@babel/plugin-proposal-class-properties": "^7.2.3",
    "@babel/preset-env": "^7.2.3",
    "@babel/preset-react": "^7.0.0",
    "babel-loader": "^8.0.4",
    "rimraf": "^2.6.3",
    "watch": "^1.0.2"
  },
  "browserslist": [
    ">0.2%",
    "not dead",
    "not ie <= 11",
    "not op_mini all"
  ]
}
' > package.json

rm -rf node_modules
rm -rf package-lock.json
npm install
npm run build
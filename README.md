# react-project-tool

It creates a library of React components that can be debugged in a react application or in storybookjs. It is completely a shell script. It works only in Linux and Mac OS.

Main idea of this npm package is like the following

- Create a react library
- Develop and test component library with storybookjs
- Use it in a react app
- Debug it in storybookjs or in a-react-app with VSCode
- Watch changes in library and then build automatically
  
## Usage

To create a new project called a-react-library, run the command

```
npx react-project-tool a-react-library
```

To create a new project called a-react-library with storybookjs, run the command

```
npx react-project-tool a-react-library -s
```

To set first component name in project init
```
npx react-project-tool a-react-library -s -c a-component-name
```

To check whether it has no issue, run the command in a-react-library dir
```
npm run start
```

or run the follwing command if you installed storybookjs
```
npm run storybook
```

To watch file changes and build it automatically while development of the library
```
npm run watch
```

## Use and debug it in a-react-app
Install a-react-library to a-react-app with file protocol file:*

Lets suppose that you have the following project folder structure
```
/projects-folder
    /a-react-app    
    /a-react-library
```

To debug with VSCode in a-react-app append following section into .vscode/launch.json in the a-react-app.

```json
    "sourceMapPathOverrides": {
        "webpack:///../src/a-react-library/*": "${workspaceFolder}/../a-react-library/src/a-react-library/*"
}
```

Or lets suppose that you have the following project folder structure
```
/projects-folder
    /a-react-app    
    /another-projects-folder
        /a-react-library
```

To debug with VSCode in a-react-app append following section into .vscode/launch.json in the a-react-app.

```json
    "sourceMapPathOverrides": {
        "webpack:///../src/a-react-library/*": "${workspaceFolder}/../another-projects-folder/a-react-library/src/a-react-library/*"
}
```

Or finally lets suppose that you have the following project folder structure
```
/projects-folder
    /another-projects-folder
        /a-react-app    
    /a-react-library
```

To debug with VSCode in a-react-app append following section into .vscode/launch.json in the a-react-app.

```json
    "sourceMapPathOverrides": {
        "webpack:///../src/a-react-library/*": "${workspaceFolder}/../../a-react-library/src/a-react-library/*"
}
```

You noticed that there is no change in ""webpack:///../src/a-react-library/*" in all cases. If you set map correctly you can debug it in VSCode.

I advise you to use https://www.npmjs.com/package/pm2 while development of your react library.

After created your react library and installed pm2 if not exists then run the following command

## Debug it in storybookjs
To debug with VSCode in storybookjs append following section into .vscode/launch.json in the a-react-library.

```json
    "sourceMapPathOverrides": {
        "webpack:///../src/a-react-library/*": "${workspaceFolder}/src/a-react-library/*"
}
```

After you ran the command,
```
    npm run storybook
```

then you can debug and develop it.
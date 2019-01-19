# react-project-tool

It creates a library of React components that can be debugged from main react application. It is completely a shell script. It works only in Linux and Mac OS.

Main idea of this npm package is like the following

- Create a react library
- Use it in a react app
- Debug it with VSCode
- Watch changes in library and then build automatically
  
## Usage

To create a new project, run the command

```
npx react-project-tool a-react-library
```

To check whether it has no issue, run the command in a-react-library dir
```
npm run start
```

To watch file changes and build it automatically while development of the library
```
npm run watch
```

## Usage of it in a react app
Install a-react-library to a react app with file protocol file:*

To debug with VSCode in a react app append following section into .vscode/launch.json.
```json
    "sourceMapPathOverrides": {
        "webpack:///../src/a-react-library/*": "${workspaceFolder}/../a-react-library/src/a-react-library/*"
}
```
You dont need to change "webpack:///../src/a-react-library/*" but "${workspaceFolder}/../a-react-library/src/a-react-library/*" must be correct for a-react-library location.
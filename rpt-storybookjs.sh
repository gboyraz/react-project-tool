#!/bin/bash

echo ${BASH_SOURCE[0]}

cd ${PROJECT_DIR}
npx -p @storybook/cli sb init

cd src/stories
rm -rf index.js

echo '
import React from "react";

import { storiesOf } from "@storybook/react";
import { action } from "@storybook/addon-actions";
import { linkTo } from "@storybook/addon-links";

import '${COMPONENT}' from "../'${PROJECT_NAME}'/'${COMPONENT}'";

storiesOf("'${COMPONENT}'", module).add("default", () => <'${COMPONENT}' />);

' > index.js

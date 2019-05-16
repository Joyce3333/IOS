# Core Motion and SpriteKit
Module A
Create an iOS application that:

Displays the number of steps a user has walked today and display the number of steps a user walked yesterday
Displays a realtime count of the number of steps a users has taken today (this could be the same label as "number of steps today")
Displays the number of steps until the user reaches a (user settable) daily goal (the goal should be saved persistently so that it is remembered even when the app restarts) 
Displays the current activity of the user: {unknown, still, walking, running, cycling, driving}
Module B
Create an additional part of the app that, whenever the user meets their step goal for the previous day, allows the playing of a simple game (it can be very simple). The game must: 

Uses {acceleration, gyro, magnetometer, OR fused motion} to control some part of the physics of a SpriteKit (or SceneKit) game
Uses two or more SpriteKit (or SceneKit) objects with dynamic physics
An idea for exceptional work (required for 7000 level students): use the steps of a user as some type of "currency" in the game to incentivize movement during the day

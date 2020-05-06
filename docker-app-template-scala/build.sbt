name := "scala-demo-app"

version := "0.0.0"
scalacOptions ++= Seq("-deprecation", "-feature")

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.github.jacobbishopxy",
      scalaVersion := "2.13.1"
    )),
    name := "scala-ei-backend",
    libraryDependencies ++= Seq(

    )
  )

enablePlugins(PackPlugin)
packGenerateWindowsBatFile := false

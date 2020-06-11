# Scala

1. Create a file name `repositories` under `.sbt` folder.
    ```
    [repositories]
    local
    nexus: http://192.168.50.130:8091/repository/maven-public
    huaweicloud-maven: https://repo.huaweicloud.com/repository/maven/
    maven-central: https://repo1.maven.org/maven2/
    sbt-plugin-repo: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
    ```

2. Create a file name `sonatype_credential` under `.sbt` folder.
    ```
    realm=Sonatype Nexus Repository Manager
    host=192.168.50.130
    user=admin
    password=admin123
    ```

3. You can also add following in your `build.sbt`, if step 1 unset.
    ```
    resolvers += ("Nexus" at "http://192.168.50.130:8091/repository" + "/maven-public").withAllowInsecureProtocol(true)
    
    // if your project needs publishing
    publishTo := {
      val nexus = Dependencies.nexus
      if (isSnapshot.value)
        Some("snapshots" at nexus + "/maven-snapshots/")
      else
        Some("releases" at nexus + "/maven-releases/")
    }
    
    credentials += Credentials(Path.userHome / ".sbt" / "sonatype_credential")
    ```

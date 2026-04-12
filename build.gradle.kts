plugins {
    kotlin("jvm") version "1.9.24"
    `maven-publish`
}

group = "io.github.yono_ms"
version = "0.0.1"

repositories {
    mavenCentral()
}

publishing {
    publications {
        create<MavenPublication>("gpr") {
            from(components["java"])
            
            groupId = project.group.toString()
            artifactId = "github-api-model"
            version = project.version.toString()
        }
    }

    repositories {
        maven {
            url = uri("https://maven.pkg.github.com/yono-ms/github-api-model")
            credentials {
                username = System.getenv("GITHUB_USER")
                password = System.getenv("GITHUB_TOKEN")
            }
        }
    }
}

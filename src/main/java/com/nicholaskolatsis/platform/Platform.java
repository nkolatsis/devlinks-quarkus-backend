package com.nicholaskolatsis.platform;

import io.quarkus.hibernate.reactive.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Version;

@Entity
@Table(name = "platforms")
public class Platform extends PanacheEntity {

    @Column(nullable=false)
    public String platform_name;

    @Column(unique=true, nullable=false)
    public String platform_code;

    @Column
    public String pattern;

    @Column
    public String icon_ref;

    @Version
    public int version;
}
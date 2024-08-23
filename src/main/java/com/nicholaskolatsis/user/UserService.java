package com.nicholaskolatsis.user;

import java.util.List;

import org.hibernate.ObjectNotFoundException;

import io.quarkus.elytron.security.common.BcryptUtil;
import io.quarkus.hibernate.reactive.panache.common.WithSession;
import io.quarkus.hibernate.reactive.panache.common.WithTransaction;
import io.smallrye.mutiny.Uni;
import jakarta.enterprise.context.ApplicationScoped;
//import org.eclipse.microprofile.jwt.JsonWebToken;

/*
 * Service handles:
 *  - findBy: Id+, email, names
 *  - create / update / delete user
 *  - addToLinks / updateLinks
 *  - password stuff
 *  - picture reference
 *  - update names
 * 
 * 
 */

@ApplicationScoped
public class UserService {

    public Uni<User> findById(long id) {
        return User.<User>findById(id)
            .onItem().ifNull().failWith(() -> new ObjectNotFoundException(id, "User"));
    }

    /* Maybe I have use for this in an admin panel?
    @WithSession
    public Uni<User> findByEmail(String email) {
        return User.find("email", email). firstResult();
    }
    */

    public Uni<List<User>> list() {
        return User.listAll();
    }

    @WithTransaction
    public Uni<User> create(User user) {
        user.password = BcryptUtil.bcryptHash(user.password);
        return user.persistAndFlush();
    }

    @WithTransaction
    public Uni<User> update(User user) {
        return findById(user.id).chain(u -> {
            user.setPassword(u.password);
            return User.getSession();
        }).chain(s -> s.merge(user));
    }

    @WithTransaction
    public Uni<Void> delete(long id) {
        return findById(id).chain(u -> u.delete());
    };

    public Uni<User> getCurrentUser() {
        // replace with a relevant method once security / jwt / auth is implemented
        return User.find("order by ID").firstResult();
    }


}

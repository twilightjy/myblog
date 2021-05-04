package cn.hust.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Rabbitmq配置类
 *
 * @author zz
 */
@Configuration
public class RabbitConfig {

    @Bean
    public Queue articleQueue() {
        return new Queue("article", true);
    }

    @Bean
    FanoutExchange maxWellExchange() {
        return new FanoutExchange("maxwell", true, false);
    }

    @Bean
    Binding bindingArticleDirect() {
        return BindingBuilder.bind(articleQueue()).to(maxWellExchange());
    }


}

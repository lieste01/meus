import { EntityRepository, Repository } from 'typeorm';
import Channel from '../entities/Channel';

interface IRequest {
  name: string;
  channelTypeUuid: string;
  description: string;
  auction: number;
  config: string;
}

@EntityRepository(Channel)
export class ChannelRepository extends Repository<Channel> {
  public async findByUuid(uuid: string): Promise<Channel | undefined> {
    const channel = this.findOne(uuid, {
      relations: ['channelTypeUuid'],
    });
    return channel;
  }
  public async createChannel({
    name,
    channelTypeUuid,
    description,
    auction,
    config,
  }: IRequest): Promise<Channel> {
    const channel = this.create({
      name,
      channelTypeUuid,
      description,
      auction,
      config,
    });

    await this.save(channel);
    return channel;
  }
}

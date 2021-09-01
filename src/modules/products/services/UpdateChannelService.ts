import AppError from '@shared/errors/AppError';
import { getCustomRepository } from 'typeorm';
import Channel from '../typeorm/entities/Channel';
import { ChannelRepository } from '../typeorm/repositories/ChannelRepository';

interface IRequest {
  uuid: string;
  name: string;
  channelTypeUuid: string;
  description: string;
  auction: number;
  config: string;
}

class UpdatechannelService {
  public async execute({
    uuid,
    name,
    description,
    auction,
    config,
  }: IRequest): Promise<Channel> {
    const channelRepository = getCustomRepository(ChannelRepository);

    const channel = await channelRepository.findOne(uuid);

    if (!channel) {
      throw new AppError(`channel not found:  ${uuid} `, 404);
    } else {
      channel.name = name;
      channel.description = description;
      channel.auction = auction;
      channel.config = config;
    }
    await channelRepository.save(channel);

    return channel;
  }
}

export default UpdatechannelService;
